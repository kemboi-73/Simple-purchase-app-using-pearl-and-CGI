### Installation and Setup Checklist

1. **Web Server Environment:**
Ensure Xampp is installed in your pc/laptop
     - If not installed, download and install XAMPP from [Apache Friends website](https://www.apachefriends.org/index.html).
2. **CGI Configuration:**
   - Enable CGI support in Apache:
     - Open the `httpd.conf` file located in `C:/xampp/apache/conf/httpd.conf`.
     - Uncomment or add the following lines to enable CGI scripts:
       ```apache
       AddHandler cgi-script .cgi .pl
       Options +ExecCGI
       ```
     - Add a `<Directory>` block to allow execution of CGI scripts:
       ```apache
       <Directory "C:/xampp/htdocs/cgi-bin">
           AllowOverride None
           Options +ExecCGI
           Require all granted
       </Directory>
       ```
     - Restart Apache after making changes to `httpd.conf`.

3. **Perl Installation:**
   - Ensure Perl is installed on your device
     - If not installed, download and install Strawberry Perl from [Strawberry Perl website](http://strawberryperl.com/).
     - During installation, ensure Perl is added to the system PATH.

4. **CGI Module for Perl:**
   - Install the CGI Perl module (if not already installed):
     - Open Command Prompt or Terminal.
     - Run the following command to install CGI module:
       ```
       cpan CGI
       ```
     - Follow any prompts to complete the installation.

5. **File Placement:**
   - Place `index.html` and `purchase.pl` files in appropriate directories:
     - `index.html` should be in `C:/xampp/htdocs/`.
     - `purchase.pl` should be in `C:/xampp/htdocs/cgi-bin/`.

6. **Testing:**
   - Access the application through a web browser:
     - Open a web browser (e.g., Chrome, Firefox).
     - Navigate to `http://localhost/index.html` to access the purchase form.
     - Fill out the form and submit to test the functionality.
