package com.mresearch.sars2.pages;

import ch.lambdaj.function.convert.Converter;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.annotations.findby.By;
import net.thucydides.core.annotations.findby.FindBy;
import net.thucydides.core.pages.PageObject;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

import static ch.lambdaj.Lambda.convert;

@DefaultUrl("http://en.wiktionary.org/wiki/Wiktionary:Main_Page")
public class SearchPage extends PageObject {
    @FindBy(name="search")
    private WebElement searchInput;
    @FindBy(name="go")
    private WebElement searchButton;
    public SearchPage(WebDriver driver) {
        super(driver);
    }
    public void enter_keywords(String keyword) {
        searchInput.sendKeys(keyword);
    }
    public void starts_search() {
        searchButton.click();
    }
    public List<String> getDefinitions() {
        WebElement definitionList = getDriver().findElement(By.tagName("ol"));
        List<WebElement> results = definitionList.findElements(By.tagName("li"));
        return convert(results, new ExtractDefinition());
    }
    class ExtractDefinition implements Converter<WebElement, String> {
        public String convert(WebElement from) {
            return from.getText();
        }
    }
}

