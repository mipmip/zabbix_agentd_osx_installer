
task :default => :help

desc 'desc: show main tasks'
task :help do
	system 'rake -T'
end

desc 'desc: show main tasks'
task :clean do
	system 'rm -fr fakeroot'
	system 'rm -fr source'
end

task :build do
		sourcedir = "./source/#{`ls ./source`}".strip
		version = sourcedir[-5..-1]
		p sourcedir
		p version

		system 'rm -fr fakeroot'
		system "mkdir fakeroot"
		system "cd #{sourcedir} && ./configure --enable-agent  --prefix=`pwd`/../../fakeroot"
		system "cd #{sourcedir} && make install"
end

task :package do
	sourcedir = "./source/#{`ls ./source`}".strip
	version = sourcedir.split('-')[1]

	system "/Applications/PackageMaker.app/Contents/MacOS/PackageMaker --doc #{pwd}/zabbixagent-installer-for-mac2.pmdoc --out zabbix_agentd-#{version}-OSX-64bit.pkg"
	print "If all went well, you should now have a functional pkg located in this directory."

end

desc 'desc: build zabbix agent installer version, git tarball as argument'
task :create, :zabbix_tarball_path do |t, args|
	if (File.exist? args[:zabbix_tarball_path].to_s)
		system 'rm -fr source'
		system "mkdir source"
		system "tar xzvf #{args[:zabbix_tarball_path].to_s} -C ./source"
		Rake::Task['build'].invoke
		Rake::Task['package'].invoke
	else
		print "Usage: rake create[/path/to/source/tarball.tar.gz]\n"
	end
end

task :killzab do
system "sudo kill -9 `ps -aef | grep zabbix_agentd | grep -v grep | awk '{print $2}'`"
end
task :pszab do
system "ps aux | grep zab"
end


