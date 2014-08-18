package com.mresearch.sars2.pages.LookupADefinitionStoryTest.steps;

import com.mresearch.sars2.pages.SearchPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.pages.Pages;
import net.thucydides.core.steps.ScenarioSteps;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class EndUserSteps extends ScenarioSteps {
    public EndUserSteps(Pages pages) {
        super(pages);
    }
    @Step
    public void looks_for(String keyword) {
        enters(keyword);
        performs_search();
    }
    @Step
    public void enters(String keyword) {
        onHomePage().enter_keywords(keyword);
    }
    @Step
    public void performs_search() {
        onHomePage().starts_search();
    }
    private SearchPage onHomePage() {
        return getPages().currentPageAt(SearchPage.class);
    }
    @Step
    public void should_see_article_with_title(String title) {
        assertThat(onHomePage().getTitle(), is(title));
    }
    @Step
    public void is_on_the_wikipedia_home_page() {
        onHomePage().open();
    }
}

