module MCollective
  module Agent
    class Mlocate<RPC::Agent

      activate_when do
        File.executable?("/usr/bin/locate")
      end

      action "updatedb" do
        reply.fail! "Cannot find updatedb at /usr/bin/updatedb" unless File.exist?("/usr/bin/updatedb")

        reply[:exitcode] = run("/usr/bin/updatedb", :stdout => :output, :chomp => true)

        reply.fail! "updatedb failed, exit code was #{reply[:exitcode]}" unless reply[:exitcode] == 0
      end

      action "locate" do
        validate :file, String

        reply.fail! "Cannot find locate at /usr/bin/locate" unless File.exist?("/usr/bin/locate")

        reply[:exitcode] = run("/usr/bin/locate #{request[:file]}", :stdout => :output, :chomp => true)

        reply.fail! "locate failed, exit code was #{reply[:exitcode]}" unless reply[:exitcode] == 0
      end

    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
