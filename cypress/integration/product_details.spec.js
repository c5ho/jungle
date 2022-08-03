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

  it("should go to the first product detail", () => {
    cy.get(".products article")
      .first()
      .click()
      .get("article")
      .should("have.class", "product-detail");
  });

  it("should go to the last product detail", () => {
    cy.get(".products article")
      .last()
      .click()
      .get(".product-detail")
      .should("exist");
  });
});
