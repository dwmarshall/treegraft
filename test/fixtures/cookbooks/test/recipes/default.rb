directory '/absolutedir'

file '/absolutedir/somefile' do
  action :touch
end

directory 'relativedir'

file 'relativedir/otherfile' do
  action :touch
end
