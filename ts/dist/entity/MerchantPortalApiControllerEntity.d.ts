import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalApiController, MerchantPortalApiControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalApiControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalApiController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalApiControllerEntity): MerchantPortalApiControllerEntity;
    create(this: any, reqdata?: MerchantPortalApiControllerCreateData, ctrl?: Control): Promise<MerchantPortalApiControllerEntity>;
}
export { MerchantPortalApiControllerEntity };
