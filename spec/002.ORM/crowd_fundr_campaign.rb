require 'pry'
class CrowdFundrCampaign < ActiveRecord::Base
  def __
    raise "Replace the __ with code to make the test pass"
  end
  
  def self.funded_campaigns
    funded = CrowdFundrCampaign.all.select do |campaign|
      campaign.total_funding >= campaign.funding_goal
    end
    
    funded
  end
  
  def self.book_campaigns
    bookie = CrowdFundrCampaign.all.select do |campaign|
      campaign.name.downcase.include? "book"
    end
    
    bookie
  end
  
  def self.latest_finish
    last = Time.new(1)
    last_campaign = nil
    
    CrowdFundrCampaign.all.each do |campaign|
      if campaign.finishing_date > last
        last = campaign.finishing_date
        last_campaign = campaign
      end
    end
    
    last_campaign
  end
end
