package com.mresearch.sars2.pages.LookupADefinitionStoryTest;

import com.mresearch.sars2.pages.LookupADefinitionStoryTest.requirements.Application;
import com.mresearch.sars2.pages.LookupADefinitionStoryTest.steps.EndUserSteps;
import net.thucydides.core.annotations.Issue;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.ManagedPages;
import net.thucydides.core.annotations.Steps;
import net.thucydides.core.annotations.Story;
import net.thucydides.core.pages.Pages;
import net.thucydides.junit.runners.ThucydidesRunner;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.WebDriver;

@Story(Application.Search.SearchByKeyword.class)
@RunWith(ThucydidesRunner.class)
public class LookupADefinitionStoryTest {
    @Managed(uniqueSession = true)
    public WebDriver webdriver;
    @ManagedPages(defaultUrl = "http://en.wiktionary.org/wiki/Wiktionary:Main_Page")
    public Pages pages;
    @Steps
    public EndUserSteps endUser;
    @Issue("#WIKI-1")
    @Test
    public void looking_up_the_definition_of_apple_should_display_the_corresponding_article() {
        endUser.is_on_the_wikipedia_home_page();
        endUser.looks_for("apple");
        endUser.should_see_article_with_title("");
    }
}
