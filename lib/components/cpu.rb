#module Hardware
  class Cpu
    def initialize
      #dmidecode -t processor
      processor = nil
      @cpus = []
      File.new("/proc/cpuinfo").readlines.map { |line|
        line.chomp!.strip!
        line.squeeze(" ").scan(/([^:]+):([^:]+)/).collect do |key, value|
          if key.strip == "processor"
            processor = value.to_i
            @cpus[processor] = {}
          else
            @cpus[processor][key.strip.gsub(/ /,"_").to_sym]=value.strip
          end
        end
      }
      @cpus
    end

    def count
      @cpus.length
    end

    def speed
      @cpus.first[:cpu_MHz]
    end

    def capacity
      # @cpus.first[:cpu_cores].to_i * count
      nil
    end

    def model
      @cpus.first[:model_name]
    end

    def serial_nums
      nil
    end

    def firmware
      nil
    end
  end
#end
