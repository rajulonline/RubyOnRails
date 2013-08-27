class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  Config = RbConfig
  Data = Data
  Date = Date
  DateTime = DateTime
  Dir = Dir
  ENV = {"GEM_PATH"=>"/Users/lakshmi/.rvm/gems/ruby-1.9.3-p374@main:/Users/lakshmi/.rvm/gems/ruby-1.9.3-p374@global", "SHLVL"=>"1", "__CF_USER_TEXT_ENCODING"=>"0x1F6:0:0", "rvm_version"=>"1.19.6 (stable)", "__array_start"=>"0", "PWD"=>"/Applications/Aptana Studio 3/AptanaStudio3.app/Contents/MacOS", "rvm_prefix"=>"/Users/lakshmi", "LOGNAME"=>"lakshmi", "Apple_Ubiquity_Message"=>"/tmp/launch-S0H2Ij/Apple_Ubiquity_Message", "IRBRC"=>"/Users/lakshmi/.rvm/rubies/ruby-1.9.3-p374/.irbrc", "RUBY_VERSION"=>"ruby-1.9.3-p374", "SSH_AUTH_SOCK"=>"/tmp/launch-1m9Zfv/Listeners", "MY_RUBY_HOME"=>"/Users/lakshmi/.rvm/rubies/ruby-1.9.3-p374", "SHELL"=>"/bin/bash", "rvm_bin_path"=>"/Users/lakshmi/.rvm/bin", "TMPDIR"=>"/var/folders/td/jm_7r6_x6fz64zl89s1nljnh0000gp/T/", "escape_flag"=>"1", "_first"=>"0", "PATH"=>"/Users/lakshmi/.rvm/gems/ruby-1.9.3-p374@main/bin:/Users/lakshmi/.rvm/gems/ruby-1.9.3-p374@global/bin:/Users/lakshmi/.rvm/rubies/ruby-1.9.3-p374/bin:/Users/lakshmi/.rvm/bin:/usr/local/mysql/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin", "_second"=>"1", "GEM_HOME"=>"/Users/lakshmi/.rvm/gems/ruby-1.9.3-p374@main", "APTANA_VERSION"=>"3.4.2.1368863613", "COMMAND_MODE"=>"unix2003", "APP_ICON_77603"=>"../Resources/aptana.icns", "USER"=>"lakshmi", "JAVA_STARTED_ON_FIRST_THREAD_78348"=>"1", "com.apple.java.jvmTask"=>"JNI", "HOME"=>"/Users/lakshmi", "rvm_env_string"=>"ruby-1.9.3-p374@main", "rvm_path"=>"/Users/lakshmi/.rvm", "COM_GOOGLE_CHROME_FRAMEWORK_SERVICE_PROCESS/USERS/LAKSHMI/LIBRARY/APPLICATION_SUPPORT/GOOGLE/CHROME_SOCKET"=>"/tmp/launch-0Nkug1/ServiceProcessSocket", "Apple_PubSub_Socket_Render"=>"/tmp/launch-jPSlIJ/Render", "rvm_ruby_string"=>"ruby-1.9.3-p374", "LANG"=>"en_US.UTF-8", "APP_ICON_78348"=>"../Resources/aptana.icns"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/Users/lakshmi/Documents/StudyRails/Learning/.metadata/.plugins/com.aptana.ruby.core/981451711/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  Proc = Proc
  Process = Process
  Psych = Psych
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2013 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p374 (2013-01-15 revision 38858) [x86_64-darwin11.4.2]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 374
  RUBY_PLATFORM = "x86_64-darwin11.4.2"
  RUBY_RELEASE_DATE = "2013-01-15"
  RUBY_REVISION = 38858
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScanError = StringScanner::Error
  ScriptError = ScriptError
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  StringScanner = StringScanner
  Struct = Struct
  Syck = Syck
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TOPLEVEL_BINDING = #<Binding:0x007fa629869378>
  TRUE = true
  TSort = TSort
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  TrueClass = TrueClass
  TypeError = TypeError
  URI = URI
  UnboundMethod = UnboundMethod
  YAML = Psych
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib

  def self.yaml_tag(arg0)
  end


  def psych_to_yaml(arg0, arg1, *rest)
  end

  def to_yaml(arg0, arg1, *rest)
  end

  def to_yaml_properties
  end


  protected


  private

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

end
