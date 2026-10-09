package voxgig.bluefintecsmerchantportalsdk.utility;

import voxgig.bluefintecsmerchantportalsdk.core.Context;
import voxgig.bluefintecsmerchantportalsdk.core.Response;
import voxgig.bluefintecsmerchantportalsdk.core.Result;

final class ResultBody {

  private ResultBody() {}

  static Result resultBody(Context ctx) {
    Response response = ctx.response;
    Result result = ctx.result;

    if (result != null) {
      if (response != null && response.jsonFunc != null && response.body != null) {
        result.body = response.jsonFunc.get();
      }
      if (response != null && response.unreadable) {
        Object sent = ctx.spec == null ? null : ctx.spec.headers;
        result.err = Response.unreadableBody(ctx, result.status, result.headers, response.body,
            sent, result.err);
      }
    }

    return result;
  }
}
