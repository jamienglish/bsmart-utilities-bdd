Feature: transform bsmart's catalog

  In order to work with bsmart's catalog easier in other applications
  As a geek
  I want to transform bsmart's catalog into a sensible xml file

  Scenario: Run bsmart-transform-xml with a bsmart catalog xml
    Given a catalog from bsmart's Stock and Sales by Suppl.Ref. - SRI called "input.xml"
    When I run `bsmart-transform-xml input.xml`
    Then the output should match the expected XML
