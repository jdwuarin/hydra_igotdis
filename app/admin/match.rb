ActiveAdmin.register Match do
	menu parent: "Tournaments"

  permit_params :tournament, :date

  index do
    id_column
    column :tournament
    column :date
    default_actions
  end

  form do |f|

  	f.inputs 'Details' do
  		f.input :tournament
  		f.input :date
  	end

  	# f.inputs do
  	# 	f.has_many :match_results do |a|
  	# 		a.inputs :oponent_id
  	# 	end
  	# end

    # f.inputs do
    #   f.has_many :match_results, heading: false, allow_destroy: true, new_record: false do |a|

    #   end
    # end
	end

end