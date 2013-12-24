# encoding: UTF-8
require 'spec_helper'

describe SVN::Downloader do
    describe '.download' do
        it 'should download repository' do
            #SVN::Downloader.download('http://.../', '/tmp/')
        end

        it 'should raise exception' do
            expect { SVN::Downloader.download('git://test/') }.to raise_error(RuntimeError)
        end
    end
end
