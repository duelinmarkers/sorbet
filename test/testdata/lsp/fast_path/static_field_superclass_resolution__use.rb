# typed: true

class ChildContainer < FieldContainerA
  def helper_method
    x = 6 + MEMBER_FIELD
    T.reveal_type(x) # error: Revealed type: `Integer`
    puts x
  end
end
