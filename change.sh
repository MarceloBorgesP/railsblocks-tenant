#!/bin/bash

BLOCK="tenant"
BLOCK_CAMEL="Tenant"
BLOCK_ROOT=`pwd`

# fix assets folder
for asset in images javascripts stylesheets; do
  mkdir ${BLOCK_ROOT}/app/assets/${asset}/railsblocks
  mv ${BLOCK_ROOT}/app/assets/${asset}/railsblocks_${BLOCK} ${BLOCK_ROOT}/app/assets/${asset}/railsblocks/${BLOCK}
done

# fix controller
ROOT_FIX="${BLOCK_ROOT}/app/controllers"
mkdir ${ROOT_FIX}/railsblocks
mv ${ROOT_FIX}/railsblocks_${BLOCK} ${ROOT_FIX}/railsblocks/${BLOCK}
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/application_controller.rb

# fix helper
ROOT_FIX="${BLOCK_ROOT}/app/helpers"
mkdir ${ROOT_FIX}/railsblocks
mv ${ROOT_FIX}/railsblocks_${BLOCK} ${ROOT_FIX}/railsblocks/${BLOCK}
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/application_helper.rb

# fix layout
ROOT_FIX="${BLOCK_ROOT}/app/views/layouts"
mkdir ${ROOT_FIX}/railsblocks
mv ${ROOT_FIX}/railsblocks_${BLOCK} ${ROOT_FIX}/railsblocks/${BLOCK}
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/application.html.erb
sed -i "" "s/railsblocks_${BLOCK}/railsblocks\/${BLOCK}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/application.html.erb

# fix bin/rails
sed -i "" "s/railsblocks_${BLOCK}/railsblocks\/${BLOCK}/g" ${BLOCK_ROOT}/bin/rails

# fix config/routes
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${BLOCK_ROOT}/config/routes.rb

# # fix lib folder
ROOT_FIX="${BLOCK_ROOT}/lib"
mkdir ${ROOT_FIX}/railsblocks
mv ${ROOT_FIX}/railsblocks_${BLOCK} ${ROOT_FIX}/railsblocks/${BLOCK}
mv ${ROOT_FIX}/railsblocks_${BLOCK}.rb ${ROOT_FIX}/railsblocks/${BLOCK}.rb

# engine namespace fix
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/engine.rb
sed -i "" "s/railsblocks_${BLOCK}/railsblocks-${BLOCK}/g" ${ROOT_FIX}/railsblocks/${BLOCK}/engine.rb

# version namespace fix
cat << EOF > ${ROOT_FIX}/railsblocks/${BLOCK}/version.rb
module Railsblocks
  module ${BLOCK_CAMEL}
    VERSION = "0.0.1"
  end
end
EOF


# module namespace fix
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${ROOT_FIX}/railsblocks/${BLOCK}.rb
sed -i "" "s/railsblocks_${BLOCK}/railsblocks\/${BLOCK}/g" ${ROOT_FIX}/railsblocks/${BLOCK}.rb

# fix rails_helpers
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${BLOCK_ROOT}/spec/rails_helper.rb

# fix Gemfile
sed -i "" "s/railsblocks_${BLOCK}/railsblocks-${BLOCK}/g" ${BLOCK_ROOT}/Gemfile

# fix Rakefile
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${BLOCK_ROOT}/Rakefile

# fix gemspec
GEMSPEC_FILE="railsblocks-${BLOCK}.gemspec"
mv ${BLOCK_ROOT}/railsblocks_${BLOCK}.gemspec ${BLOCK_ROOT}/${GEMSPEC_FILE}
sed -i "" "s/railsblocks_${BLOCK}\/version/railsblocks\/${BLOCK}\/version/g" ${BLOCK_ROOT}/${GEMSPEC_FILE}
sed -i "" "s/railsblocks_${BLOCK}/railsblocks-${BLOCK}/g" ${BLOCK_ROOT}/${GEMSPEC_FILE}
sed -i "" "s/Railsblocks${BLOCK_CAMEL}/Railsblocks::${BLOCK_CAMEL}/g" ${BLOCK_ROOT}/${GEMSPEC_FILE}

# fix README
sed -i "" "s/railsblocks_${BLOCK}/railsblocks-${BLOCK}/g" ${BLOCK_ROOT}/README.md

echo "Dont forget to run bundle install to overwrite Gemfile.lock"
echo "Done! ;)"
