describe('Jungle App Home Page', () => {
  beforeEach(() => {
    cy.visit('/');
  })

  it("There should render the home page, click on the product, and show the product page", () => {
    cy.get(".products article").first().click()
    cy.get(".products-show").should("exist");
  });
});