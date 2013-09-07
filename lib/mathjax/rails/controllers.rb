class MathjaxRailsController < ActionController::Base
  def give_out_static_file
    ext = ''
    ext = ".#{params[:format]}" if params[:format]
    filename = params[:uri]+ext
    filepath = "../../../../vendor/#{Mathjax::Rails::DIRNAME}/#{filename}"
    
    extname = File.extname(filename)[1..-1]
    mime_type = Mime::Type.lookup_by_extension(extname)
    options = Hash.new 
    options[:type] = mime_type.to_s unless mime_type.nil?
    options[:disposition] = 'inline'
    send_file File.expand_path(filepath,__FILE__), options
  end
end
