# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: :div, class: "form-group", error_class: "has-error" do |b|

    # Form extensions
    b.use :html5
    b.use :placeholder

    # Form components
    b.use :label
    # b.wrapper tag: :div do |ba|
    b.use :input
    b.use :hint,  wrap_with: { tag: :p, class: "help-block" }
    b.use :error, wrap_with: { tag: :span, class: "help-block text-danger" }
    # end
  end

  # config.form_class = "form-horizontal"
  config.default_wrapper = :bootstrap
end
