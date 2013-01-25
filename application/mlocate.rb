class MCollective::Application::Mlocate<MCollective::Application
   description "Locate files (mlocate) on the Agents"

    usage <<-END_OF_USAGE
mco mlocate [OPTIONS] [FILTERS] <ACTION> <file>

The ACTION can be one of the following:

    locate <file> -  locate file(s) on the agents
    END_OF_USAGE

    def post_option_parser(configuration)
      if ARGV.size < 2
        raise "Please specify action"
      else
        action  = ARGV.shift
        file  = ARGV.shift

        unless action.match(/^(locate)$/)
          raise "Action can only be locate."
        end

        configuration[:action]  = action
        configuration[:file]  = file
      end
    end

    def validate_configuration(configuration)
      if MCollective::Util.empty_filter?(options[:filter])
        print "Do you really want to operate on " +
          "services unfiltered? (y/n): "

        STDOUT.flush

        # Only match letter "y" or complete word "yes" ...
        exit! unless STDIN.gets.strip.match(/^(?:y|yes)$/i)
      end
    end

    def main
      action  = configuration[:action]
      file  = configuration[:file]

      mc = rpcclient("mlocate", {:options => options})

      #printrpc mc.version(:options => options)
      mc.send(action, { :file => file }).each do |node|

        sender = node[:sender]
        data = node[:data]

        if data[:exitcode] == 1
          found = "not found!"
        else
          found = data[:output]
          printf("%-40s:\n", sender, found)
          printf("%-80s\n\n", found)
        end

      end

      mc.disconnect

      puts
      printrpcstats :summarize => true

    end
end
