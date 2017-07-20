module SimpleAdminHelper
  def resource_link(resource, method, prefix = nil, namespace = :admin)
    model_klass_name = resource.class.name.demodulize.underscore

    case method
    when :create
      model_klass_name = model_klass_name.pluralize
    when :new
      prefix = :new
    when :edit
      prefix = :edit
    end

    resource_path = "#{namespace}_#{model_klass_name}_path"
    resource_path = "#{prefix}_#{resource_path}" if prefix.present?

    public_send(resource_path, resource)
  end

  def str_to_collection(string)
    arr = string.split('.')
    object = arr[0].constantize

    arr[1..arr.size].each do |method|
      object = object.public_send(method)
    end

    object
  end
end