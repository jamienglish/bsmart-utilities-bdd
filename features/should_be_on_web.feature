Feature: Show stock that should be on the web

  Scenario: All stock in the xml file is already on web
    Given an xml file named "catalog.xml" with the following products:
      | StockNum  | Reference   | Description | CurrStk | 
      | 77-01-618 | 0008-051-14 | Heart white | 0000001 | 
      | 77-01-619 | 0009-001-12 | Padlock     | 0000001 | 
      | 77-01-620 | 0010-051-14 | Key         | 0000003 | 
    And the following images
      | image         | 
      | 77-01-618.jpg | 
      | 77-01-619.jpg | 
      | 77-01-620.jpg | 
    And a csv file named "web.csv" with the following products:
      | sku     | name        | 
      | 7701618 | Heart white | 
      | 7701619 | Padlock     | 
      | 7701620 | Key         | 
    When I run `should-be-on-web catalog.xml web.csv`
    Then the output should contain exactly "Nothing!\n"

  Scenario: Products in stock with images but not on web
    Given an xml file named "catalog.xml" with the following products:
      | StockNum  | Reference   | Description | CurrStk | 
      | 77-01-618 | 0008-051-14 | Heart white | 0000001 | 
      | 77-01-619 | 0009-001-12 | Padlock     | 0000001 | 
      | 77-01-620 | 0010-051-14 | Key         | 0000003 | 
    And the following images
      | image               | 
      | 77/01/77-01-618.jpg | 
      | 77/01/77-01-619.jpg | 
      | 77/01/77-01-620.jpg | 
    And a csv file named "web.csv" with the following products:
      | sku     | name        |
      | 7701621 | Heart white |
      | 7701622 | Padlock     |
      | 7701623 | Key         |
    When I run `should-be-on-web catalog.xml web.csv`
    Then the output should match the following:
      | sku       | name        |
      | 77-01-618 | Heart white |
      | 77-01-619 | Padlock     |
      | 77-01-620 | Key         |

  Scenario: Give me all stock that isn't on web
    Given an xml file named "catalog.xml" with the following products:
      | StockNum  | Reference | Description | CurrStk | 
      | 77-01-001 | ref1      | Product 1   | 1       | 
      | 77-01-002 | ref2      | Product 2   | 2       | 
      | 77-01-003 | ref3      | Product 3   | 0       | 
    And a csv file named "web.csv" with the following products:
      | sku     | name      |
      | 7701001 | Product 1 |
    When I run `should-be-on-web --ignore_images catalog.xml web.csv`
    Then the output should match the following:
      | sku       | name      | 
      | 77-01-002 | Product 2 | 
