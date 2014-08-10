require 'spec_helper'
require_relative '../lib/vigenere'

# This tests the ability of the vignere cipher to encode
# the word using a phrase and the vignere keyword.
describe Vigenere do

  # Tests the encoding method. Used the Wikipedia phrase and keyword, then
  # used my own APPLE and PIE to make sure it worked.
  describe "#encode" do
    it "should encode ATTACKATDAWN with the keyword LEMON" do
      expect(Vigenere.encode("ATTACKATDAWN", "LEMON")).to eq("LXFOPVEFRNHR")
    end

    it "should encode APPLE with the keyword PIE" do
      expect(Vigenere.encode("APPLE", "PIE")).to eq("PXTAM")
    end
  end

  # Reversed the encoding method to see if decoding worked.
  describe "#decode" do
    it "should decode LXFOPVEFRNHR to ATTACKATDAWN with the keyword LEMON" do
      expect(Vigenere.decode("LXFOPVEFRNHR", "LEMON")).to eq("ATTACKATDAWN")
    end

    it "should decode PXTAM to APPLE with the keyword PIE" do
      expect(Vigenere.decode("PXTAM", "PIE")).to eq("APPLE")
    end
  end
end
