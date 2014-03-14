class CrowdFundrCampaign < ActiveRecord::Base
  def __
    raise "Replace the __ with code to make the test pass"
  end

  def self.funded_campaigns
    where("funding_goal <= total_funding")
  end

  def self.book_campaigns
    where("name LIKE '%Book%'")
  end

  def self.latest_finish
    order(finishing_date: :desc).take(1).first
  end
end
