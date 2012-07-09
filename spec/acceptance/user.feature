Feature: User
  Scenario: Visit the home page
    When I visit "/"
    Then I should see "JustinCampbell.me"

  Scenario: HTML Resume
    When I visit "/resume"
    Then I should see "Justin Campbell"

  Scenario: Markdown Resume
    When I visit "/resume.md"
    Then I should see "Justin Campbell"

