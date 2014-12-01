package coreservlets;

/** Driver information for a vendor.  Defines the vendor
 *  keyword, description, driver class, and URL construct for
 *  connecting to a database.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall and Larry Brown.
 *  May be freely used or adapted.
 */

public class DriverInfoBean {
  private String vendor;
  private String description;
  private String driverClass;
  private String url;

  public DriverInfoBean(String vendor,
                        String description,
                        String driverClass,
                        String url) {
    this.vendor = vendor;
    this.description = description;
    this.driverClass = driverClass;
    this.url = url;
  }
  public String getVendor() {
    return(vendor);
  }

  public String getDescription() {
    return(description);
  }

  public String getDriverClass() {
    return(driverClass);
  }

  public String getURL() {
    return(url);
  }
}  