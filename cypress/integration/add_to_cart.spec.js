describe('Jungle App Cart', () => {
  beforeEach(() => {

    cy.visit('/')
  })

  it("should increase the number of items in the cart by 1 when they click Add to Cart", () => {
    cy.get('.end-0').contains('(0)').should('exist')
    cy.get('.cart-btn').first().click({ force: true })
    cy.get('.end-0').contains('(1)').should('exist')
  });
});