# -*- coding: utf-8 -*-
require_relative '../lib/srt_parser.rb'
require 'minitest/autorun'

class TestSrtParser < MiniTest::Unit::TestCase
  def test_iyc_remove_tags
    assert_equal 'content', iyc_remove_tags('<tag>content</tag>'), 'simpel tags'
    assert_equal 'content', iyc_remove_tags('<1><2>content</2></1>'), 'nested tags'
    assert_equal 'content', iyc_remove_tags('<1>con<2>te<la>nt'), 'broken tags'
  end
  INPUT = '''
1
00:00:00,637 --> 00:00:02,434
<i>Previously on</i>
The Big Bang Theory:

2
00:00:02,435 --> 00:00:03,779
Who says something like that
'''

  OUTPUT = '''
<i>Previously on</i>
The Big Bang Theory:

Who says something like that
'''

INPUT2 = "1\ntext\n2\ntext 2"
OUTPUT2 = "text\ntext 2"

  def test_iyc_srt_to_text
    assert_equal OUTPUT , iyc_srt_to_text(INPUT), 'case 1'
    assert_equal OUTPUT2 , iyc_srt_to_text(INPUT2), 'case 2'
  end

  def test_iyc_remove_empty_lines
    assert_equal '', iyc_remove_empty_lines("\n"), 'line feed only'
    assert_equal '', iyc_remove_empty_lines("  \n"), 'spaces'
    assert_equal '', iyc_remove_empty_lines("\t\n"), 'tabs'
    assert_equal '', iyc_remove_empty_lines("\t \n"), 'spaces and tabs'
  end
end
