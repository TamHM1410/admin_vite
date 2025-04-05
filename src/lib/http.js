import axios from "axios";

export const http = axios.create({
  baseURL: "https://admin.tamdeptrai.com/",
  timeout: 30000,
  headers: {
    "Content-Type": "application/json",
  },
});

http.interceptors.request.use(async (request) => {
  request.headers.Authorization = `Bearer `;
  return request;
});

const handleResponse = (res) => {
  if (res && res.data) {
    return res.data;
  }

  return res;
};

const handleError = (error) => {
  return error;
};

http.interceptors.response.use(
  (response) => {
    const res = handleResponse(response);
    return res;
  },
  async (error) => {
    return Promise.reject(handleError(error));
  }
);
