class CouponFormBuilder < ActionView::Helpers::FormBuilder
	def match(home,away,group,match)
		@template.content_tag(:div, :class => "match") do
			@template.tag(:img, :src => "/assets/logos/#{home.gsub(" ", "_")}.png", :title => home) + 
			"\n" +
			text_field("home_score_#{group.downcase}_#{match}", :class => "input-small") + ":" +
			"\n" +
			text_field("away_score_#{group.downcase}_#{match}", :class => "input-small") +
			"\n" +
			@template.tag(:img, :src => "/assets/logos/#{away.gsub(" ", "_")}.png", :title => away)  +
			"\n"
		end
	end
end