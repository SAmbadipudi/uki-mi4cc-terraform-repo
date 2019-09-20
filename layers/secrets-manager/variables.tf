variable "values-stored" {
   description = "Values needs to be store under secrets manager"
   type = "map"
   default = {
    db_username = "sysadmin"
    db_password = "avaya1"
    db_url = "jdbc:Cache://10.32.254.50:1972/CCMS_STAT"
    jdbc_driver_name = "com.intersys.jdbc.CacheDriver"
  }
}

