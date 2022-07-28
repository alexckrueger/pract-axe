class Training < ApplicationRecord
  belongs_to :user
  has_many :throws

  def throws_desc
    throws.order(created_at: :desc)
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def throw_count
    throws.count
  end

  def average_axe
    total_points = []
    throws.each do |axe|
      total_points << axe.points
    end
    (total_points.reduce(:+)/total_points.length.to_f).round(2)
  end

  def hatchet_throws
    hatchets = {} # Output hash
    hatchet_throws = throws.where(big_axe: false)
    hatchet_bullseyes = throws.where(big_axe: false, clutch_called: false)
    hatchet_clutches = throws.where(big_axe: false, clutch_called: true)

    hatchets[:throw_count] = hatchet_throws.length

    if hatchets[:throw_count] > 0
      hatchet_points = []
      hatchet_throws.each do |axe|
        hatchet_points << axe.points
      end
      hatchets[:average_axe] = (hatchet_points.reduce(:+)/hatchets[:throw_count].to_f).round(2)

      # Hatchet Bullseye stats
      hatchets[:bullseye_attempts] = hatchet_bullseyes.length
      if hatchets[:bullseye_attempts] > 0
        hatchets[:bullseye_accuracy] = ((hatchet_bullseyes.where(points: 5).length/(hatchets[:bullseye_attempts]).to_f).round(2) * 100).to_i
      end
  
      # Hatchet Clutch stats
      hatchets[:clutch_attempts] = hatchet_clutches.length
      if hatchets[:clutch_attempts] > 0
        hatchets[:clutch_accuracy] = ((hatchet_clutches.where(points: 7).length/(hatchets[:clutch_attempts]).to_f).round(2) * 100).to_i
      end
    end
    
    return hatchets
  end

  def big_axe_throws
    big_axes = {} # Output hash
    big_axe_throws = throws.where(big_axe: true)
    big_axe_bullseyes = throws.where(big_axe: true, clutch_called: false)
    big_axe_clutches = throws.where(big_axe: true, clutch_called: true)

    big_axes[:throw_count] = big_axe_throws.length

    if big_axes[:throw_count] > 0
      big_axe_points = []
      big_axe_throws.each do |axe|
        big_axe_points << axe.points
      end
      big_axes[:average_axe] = (big_axe_points.reduce(:+)/big_axes[:throw_count].to_f).round(2)

      # Big Axe Bullseye stats
      big_axes[:bullseye_attempts] = big_axe_bullseyes.length
      if big_axes[:bullseye_attempts] > 0
        big_axes[:bullseye_accuracy] = ((big_axe_bullseyes.where(points: 5).length/(big_axes[:bullseye_attempts]).to_f).round(2) * 100).to_i
      end
  
      # Big Axe Clutch stats
      big_axes[:clutch_attempts] = big_axe_clutches.length
      if big_axes[:clutch_attempts] > 0
        big_axes[:clutch_accuracy] = ((big_axe_clutches.where(points: 7).length/(big_axes[:clutch_attempts]).to_f).round(2) * 100).to_i
      end
    end
    
    return big_axes
  end


end
