desc 'Rent Updater'

task check_late_return_rents: :environment do
  Rent.where(status: [:pending, :late]).each do |rent|
    if rent.pending? and Date.today.to_date > rent.rental_end_date.to_date
      puts "::::::: Setting as late this rent #{rent.id}"
      rent.mark_as_late!
    elsif rent.late?
      puts "::::::: Updating penalty amount for this late rent #{rent.id}"
      rent.update_late_penalty_amount
    end
  end

end


#  status                        :integer          default("pending")
#  rental_end_date               :date
#  rental_return_date            :date
#  return_on_time                :boolean          default(TRUE)
#  delayed_return_days           :integer          default(0)
#  rental_total_ammount          :decimal(5, 1)    default(0.0)
#  delayed_rental_penalty_amount :decimal(5, 1)    default(0.0)
#  total_to_pay                  :decimal(5, 1)    default(0.0)
#  created_at                    :datetime         not null
#  updated_at
