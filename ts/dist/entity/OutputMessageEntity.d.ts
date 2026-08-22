import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputMessage, OutputMessageLoadMatch } from '../BluefinTecsMerchantPortalTypes';
declare class OutputMessageEntity extends BluefinTecsMerchantPortalEntityBase<OutputMessage> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputMessageEntity): OutputMessageEntity;
    load(this: any, reqmatch?: OutputMessageLoadMatch, ctrl?: Control): Promise<OutputMessageEntity>;
}
export { OutputMessageEntity };
