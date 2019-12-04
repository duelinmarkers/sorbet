# typed: true
def foo
  bar
end

def bar
  bt = Thread.current.backtrace.join("\n")
  bt = bt.gsub(/^.*com_stripe_sorbet_llvm\//, '')
  bt = bt.gsub(/^.*ruby_2_6_3\//, '')
  bt = bt.gsub(/^.*tmp\..*:/, ':')

  # for now (maybe?) the monkeypatching has different backtraces
  bt = bt.gsub("lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'", '')
  bt = bt.gsub("run/tools/patch_require.rb:28:in `require'", '')
  bt = bt.gsub("run/tools/patch_require.rb:36:in `require'", '')
  bt = bt.gsub("\n\n", "\n")

  bt
end

puts foo
