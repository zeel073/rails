Given("I am logged in") do
  new_user = NewUser.create(email: "zeelsakariya07@gmail.com", password: "123456")
  visit new_new_user_session_path
  fill_in "Email", with: new_user.email
  fill_in "Password", with: new_user.password
  click_button "Log in"
end

Given("I am on the homepage") do
  visit students_path
end

Given("I am on the products page") do
  visit products_path
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

When("I click on student's name") do
  visit student_path(Student.first.id)
end

Then("I should see details of that student") do
  student = Student.first
  expect(page).to have_content(student.rollNo)
  expect(page).to have_content(student.remarks)
end

When("I click on Create new record option") do
  visit new_student_path
end

And("Create new record") do
  new_student = Student.new(rollNo: "1234", name: "cucumber rspec", remarks: "kaakdiiiiiiiiiiiii", status: "private", email: "1234@1234.com")
  new_student.save!
end

Then("I should redirected to new student's show page") do
  student = Student.find_by(remarks: "kaakdiiiiiiiiiiiii")
  visit student_path(student.id)
end

