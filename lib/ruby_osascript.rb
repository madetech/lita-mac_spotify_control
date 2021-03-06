require 'open3'
require 'ostruct'

def osascript(script)
  stdout, stderr, status = Open3.capture3('osascript',
                                          *script.split(/\n/).map { |line| ['-e', line] }.flatten)

  OpenStruct.new(
    stdout: stdout.chomp,
    stderr: stderr.chomp,
    status: status
  )
end
