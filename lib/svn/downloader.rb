require 'svn/downloader/version'
require 'net/dav'
require 'uri'
require 'fileutils'

# SVN module for SVN related functionality
module SVN
    # Downloader module for SVN repository downloading
    module Downloader
        # XML header
        XML_HEAD = '<?xml version="1.0" encoding="utf-8"?>'
        # WebDAV Namespace
        DAV_NS = 'DAV:'
        # WebDAV SVN Namespace
        SVN_DAV_PROP_NS_DAV = 'http://subversion.tigris.org/xmlns/dav/'
        # XML Namespaces
        NAMESPACES = { 'D' => DAV_NS }

        protected

        def self.propfindData(props = [])
            str = XML_HEAD
            str += "<propfind xmlns=\"#{DAV_NS}\">"
            str <<   '<prop>'
            props.each do |data|
                str <<  "<#{data.first} xmlns=#{data.last.encode(:xml => :attr)} />"
            end
            str <<   '</prop>'
            str << '</propfind>'
            str
        end

        public

        # download files from remote repository
        # @param [String] url The URL to the remote repository
        # @param [String] path The local path where to save downloaded repository
        def self.download(url, path = './tmp/')
            uri = URI.parse(url)
            case uri.scheme
            when 'http','https'
                fromHTTP(uri, path)
            when 'svn'
                fromSVN(uri, path)
            else
                raise RuntimeError.new('Unrecognized protocol ' + uri.scheme)
            end
        end

        # download files from remote repository over HTTP protocol
        # @param [String] uri The URI to the remote repository
        # @param [String] path The local path where to save downloaded repository
        def self.fromHTTP(uri, path)
            Net::DAV.start(uri) do |dav|
                downloadFolder(dav, uri.path, path)
            end
        end

        # download files from remote repository over SVN protocol
        # @param [String] uri The URI to the remote repository
        # @param [String] path The local path where to save downloaded repository
        def self.fromSVN(uri, path)
            # TODO
            raise RuntimeError.new('SVN protocol is not implemented yet')
        end

        protected

        def self.downloadFolder(dav, url, path)
            doc = dav.propfind(url, propfindData([['resourcetype', DAV_NS]]))
            doc.xpath('.//D:response', NAMESPACES).each do |item|
                href = item.%('./D:href', NAMESPACES).content
                isFolder = item.%('.//D:collection', NAMESPACES) ? true : false
                location = path + File::SEPARATOR + href.split('/').last
                next if href.chomp('/') == url.chomp('/')
                FileUtils.mkdir_p(path) unless File.exists?(path)
                if isFolder
                    downloadFolder(dav, href, location)
                else
                    data = dav.get(href)
                    File.open(location, 'wb') { |f| f.write(data) }
                    puts location
                end
            end
        end
    end
end
