package judgels.jerahmeel.api.chapter.submission.bundle;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import java.util.Map;
import judgels.jophiel.api.profile.Profile;
import judgels.persistence.api.Page;
import judgels.sandalphon.api.problem.bundle.ItemType;
import judgels.sandalphon.api.submission.bundle.ItemSubmission;
import org.immutables.value.Value;

@Value.Immutable
@JsonDeserialize(as = ImmutableChapterItemSubmissionsResponse.class)
public interface ChapterItemSubmissionsResponse {
    Page<ItemSubmission> getData();
    Map<String, Profile> getProfilesMap();
    Map<String, String> getProblemAliasesMap();
    Map<String, Integer> getItemNumbersMap();
    Map<String, ItemType> getItemTypesMap();

    class Builder extends ImmutableChapterItemSubmissionsResponse.Builder {}
}