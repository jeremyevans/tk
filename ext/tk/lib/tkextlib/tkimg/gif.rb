#
#  TkImg - format 'gif'
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#
require 'tk'

# call setup script for general 'tkextlib' libraries
require 'tkextlib/setup.rb'

# call setup script
require 'tkextlib/tkimg/setup.rb'

# TkPackage.require('img::gif', '1.3')
TkPackage.require('img::gif')

module Tk
  module Img
    module GIF
      def self.package_version
	begin
	  TkPackage.require('img::gif')
	rescue
	  ''
	end
      end
    end
  end
end
