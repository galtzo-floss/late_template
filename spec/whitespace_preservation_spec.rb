# frozen_string_literal: true

load File.expand_path('../exe/late_template', __dir__)

RSpec.describe 'Whitespace preservation when accepting chunks' do
  it 'preserves leading spaces when accepting a hunk' do
    left = "Line 1\n  indented line\nLine 3\n"
    right = "Line 1\nindented line\nLine 3\n"

    rs = ReadmeSync.new(template_path: __FILE__, target_path: __FILE__)

    left_lines = left.lines(chomp: false)
    right_lines = right.lines(chomp: false)

    sdiff = Diff::LCS.sdiff(right_lines, left_lines)
    hunks = rs.send(:build_hunks, sdiff)
    expect(hunks.size).to be >= 1

    current_right = right_lines.dup

    # Apply first hunk as replace (accept)
    rs.send(:apply_left_over_right!, current_right, hunks.first, keep_right: false, position: :replace)

    expect(current_right.join).to eq(left)
  end
end
