describe("Jungle app", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should add the first product to the cart", () => {
    cy.get(".products article .btn")
      .first()
      .click()
      .get(".end-0 > .nav-link")
      .should("contain", "My Cart (1)");
  });

  it("should not be able to add the last product to the cart (out of stock)", () => {
    cy.get(".products article div p").should("have.class", "soldout");
  });
});
