import axiosCustom from './index';

export const postAuthSignup = async (signupForm: Record<string, string>) => {
  try {
    const { data } = await axiosCustom.post('/api/signup', signupForm);
    return data;
  } catch (error) {
    throw error;
  }
};

export const postAuthLogin = async (loginForm: Record<string, string>) => {
  try {
    const { data } = await axiosCustom.post('/api/login', loginForm);
    console.log(data.tokenInfo);
    return data;
  } catch (error) {
    throw error;
  }
};