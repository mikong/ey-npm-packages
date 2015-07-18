# NPM Packages Installation

This cookbook automates the installation of npm packages by running the following command on the server:

```
sudo npm install -g package
```

It will then make the executable accessible by symlinking the bin file to /usr/local/bin which is part
of the PATH in EY Cloud.

This is useful if you need the executables of your npm packages to be available on the server's command line inteface.

Check recipes/default.rb for more details, and feel free to customize it for your own environment.

## Using it

1. Add the npm packages in attributes/npm_packages.rb.
2. Add this directory to your cookbooks directory, and enable it in main/recipes/defaul.rb.
3. Upload and apply this to your staging environment for testing.

## Example

```
default[:npm_packages] = [{:name => "bunyan", :command => "bunyan"},
                          {:name => "grunt", :command => "grunt"},
                          {:name => "grunt-cli"}]

```
