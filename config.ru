require './config/environment'

use Rack::MethodOverride
use CountriesController
use UsersController
use CompaniesController
use CompanyAddressesController
use CompanyContactsController
run ApplicationController
