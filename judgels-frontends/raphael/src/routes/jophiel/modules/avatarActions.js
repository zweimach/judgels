import { selectToken } from '../../../modules/session/sessionSelectors';
import { userAvatarAPI } from '../../../modules/api/jophiel/userAvatar';
import * as toastActions from '../../../modules/toast/toastActions';

export const MAX_AVATAR_FILE_SIZE = 100 * 1024;

export function avatarExists(userJid) {
  return async () => {
    return await userAvatarAPI.avatarExists(userJid);
  };
}

export function renderAvatar(userJid) {
  return async () => {
    return await userAvatarAPI.renderAvatar(userJid);
  };
}

export function updateAvatar(userJid, file) {
  return async (dispatch, getState) => {
    const token = selectToken(getState());
    await userAvatarAPI.updateAvatar(token, userJid, file);

    toastActions.showSuccessToast('Avatar updated.');
  };
}

export function deleteAvatar(userJid) {
  return async (dispatch, getState) => {
    const token = selectToken(getState());
    await userAvatarAPI.deleteAvatar(token, userJid);

    toastActions.showSuccessToast('Avatar removed.');
  };
}

export function rejectAvatar(file) {
  return async () => {
    if (file.size > MAX_AVATAR_FILE_SIZE) {
      toastActions.showErrorToast(new Error(`File too large (max ${MAX_AVATAR_FILE_SIZE / 1024} KB).`));
    }
  };
}
