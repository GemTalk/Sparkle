# Replace CSS styles in html file
BEGIN{
        while ( (getline line) > 0 )
        {
            print line
            if (line ~ "^code {") {  
                inCodeSection = "true"
            }
            if (inCodeSection ~ "true" && line ~ "^}") {
                    inCodeSection = "false"
            }
            if (inCodeSection ~ "true" && line ~ "font-family") {
                print "\tfont-weight: bold;"
            }
            if (line ~ "^:not.pre.") {
                getline discardColor
                print "\tcolor: #602020;"
            }
        }
    }
