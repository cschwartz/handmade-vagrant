#
# Cookbook Name:: handmade-dev
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'chocolatey'

%w(classic-shell visualstudiocommunity2013).each do |pack|
  chocolatey pack
end

directory 'c:\\build' do
  action :create
end

require 'win32ole'
all_users_desktop = WIN32OLE.new('WScript.Shell').SpecialFolders('AllUsersDesktop')

windows_shortcut "#{all_users_desktop}\\cmd.lnk" do
  target 'C:\\Windows\\System32\\cmd.exe'
  arguments '/k C:\\vagrant\\handmade\\misc\\shell.bat'
  cwd 'C:\\build\\'
  description 'Launch CommandLine'
  iconlocation 'C:\\Windows\\System32\\cmd.exe, 0'
end
