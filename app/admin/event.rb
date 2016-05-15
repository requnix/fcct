ActiveAdmin.register Event do
  scope :upcoming, default: true
  scope :recent

  index do
    selectable_column
    column :title
    column :occurs_on
    column :updated_at
    column(:committee) { |event| status_tag event.committee_only? }
    column(:marshal)   { |event| status_tag event.marshal_only? }
    actions
  end

  # filter :committee_only
  # filter :marshal_only

  show do
    attributes_table do
      row :title
      row :timeframe
      row(:poster) { status_tag event.poster.present? }
    end

    panel "Writeup #{"by #{event.writeup_author.full_name}" if event.writeup_author}" do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      raw markdown.render event.writeup
    end if event.writeup.present?

    active_admin_comments
  end

  sidebar 'Poster', only: :show do
    image_tag(event.poster.url, width: 200, height: 300) if event.poster.present?
  end

  form do |_|
    semantic_errors

    inputs 'Details' do
      input :title
      input :occurs_on
      input :starts_at
      input :ends_at
      input :committee_only
      input :marshal_only
      input :poster, as: :file, required: false
      input :writeup
      input :writeup_author
    end

    actions
  end

  permit_params :title, :occurs_on, :starts_at, :ends_at, :poster,
                :committee_only, :marshal_only,
                :writeup, :writeup_author_id
end
