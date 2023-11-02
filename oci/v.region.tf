variable region {
  type                  = map(any)
  default               = {
    iad                 = {
      name              = {
        display_name    = "Ashburn"
        long            = "us-ashburn-1"
        name            = "ashburn"
        short           = "iad"
      }
    } 
  }
}