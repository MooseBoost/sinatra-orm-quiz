class CrowdFundrCampaign < ActiveRecord::Base
  def __
    raise "Replace the __ with code to make the test pass"
  end

  def self.funded_campaigns
    where("funding_goal <= total_funding")
  end

  def self.book_campaigns
    binding.pry
    where("name LIKE '%Book%'")
  end
end
