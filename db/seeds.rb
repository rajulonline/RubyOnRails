# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Status.create(:name => 'Open')
# Status.create(:name => 'Closed')
# Status.create(:name => 'In Progress')
# Status.create(:name => 'Completed')
# Status.create(:name => 'Passed')
# Status.create(:name => 'Failed')
# Status.create(:name => 'Awaiting Approval')

# Defecttype.create(:type => 'Regression' )
# Defecttype.create(:type => 'UnitTest')
# Defecttype.create(:type => 'Missed during regression')
# Defecttype.create(:type => 'Adhoc')
# Defecttype.create(:type => 'Automation')
# Defecttype.create(:type => 'Production')


Defectseverity.create(:severity=>'Cosmetic Defect')
Defectseverity.create(:severity=>'Show stopper')
Defectseverity.create(:severity=>'Minor')
Defectseverity.create(:severity=>'Work around possible')
Defectseverity.create(:severity=>'Major but not show stopper')


