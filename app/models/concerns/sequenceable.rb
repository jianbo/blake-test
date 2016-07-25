module Sequenceable
  extend ActiveSupport::Concern

  def next_item
    @next_item ||= begin
      by = self.send(self.sequence_by)
      sequence = Sequence.where(sequenceable_type: by.class.to_s, sequenceable_id: by.id).first
      unless sequence
        Rails.logger.info "Unable to find any sequence for id #{self.id}"
        return nil
      end
      current_index = sequence.sequence_ids.index(self.id)
      sequence.sequence_ids[current_index + 1]
    end
  end

  module ClassMethods
    def sequenceable(sequenceable)
      self.send(:define_method, :sequence_by) do
        sequenceable
      end
    end
  end
end