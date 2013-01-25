metadata    :name        => "mlocate",
            :description => "Locate files on your filesystems",
            :author      => "S. Heijmans",
            :license     => "ASL2",
            :version     => "1.0",
            :url         => "https://github.com/sheijmans/mlocate",
            :timeout     => 180

action "updatedb", :description => "Update the local database for mlocate" do
    output :output,
           :description => "Output from updatedb",
           :display_as  => "Output"

    output :exitcode,
           :description => "The exitcode from the updatedb command",
           :display_as => "Exit Code"
end

action "locate", :description => "Locate a file" do
    display :always

    input :file,
          :prompt      => "File to locate",
          :description => "File to locate",
          :type        => :string,
          :validation  => '.',
          :optional    => false,
          :maxlength   => 30

    output :output,
           :description => "Output from updatedb",
           :display_as  => "Output"

    output :exitcode,
           :description => "The exitcode from the updatedb command",
           :display_as => "Exit Code"
end
